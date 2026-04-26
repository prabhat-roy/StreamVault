// StreamVault transcoding-service
// FFmpeg-based transcoding engine. This skeleton exposes a minimal HTTP /healthz
// over Boost.Beast / Boost.Asio. Future waves wire in libavformat/libavcodec for
// HLS/DASH/CMAF segmenting and per-title VMAF-driven bitrate ladder selection.

#include <iostream>
#include <string>
#include <thread>
#include <cstdlib>

#include <boost/asio.hpp>
#include <boost/beast.hpp>

namespace beast = boost::beast;
namespace http  = beast::http;
namespace net   = boost::asio;
using tcp       = net::ip::tcp;

static void handle_session(tcp::socket socket) {
    try {
        beast::flat_buffer buffer;
        http::request<http::string_body> req;
        http::read(socket, buffer, req);

        http::response<http::string_body> res{http::status::ok, req.version()};
        res.set(http::field::server, "streamvault-transcoding");
        res.set(http::field::content_type, "application/json");
        if (req.target() == "/healthz") {
            res.body() = R"({"status":"ok","service":"transcoding-service"})";
        } else {
            res.result(http::status::not_found);
            res.body() = R"({"error":"not_found"})";
        }
        res.prepare_payload();
        http::write(socket, res);

        beast::error_code ec;
        socket.shutdown(tcp::socket::shutdown_send, ec);
    } catch (std::exception& e) {
        std::cerr << "session error: " << e.what() << std::endl;
    }
}

int main() {
    const char* port_env = std::getenv("PORT");
    unsigned short port = port_env ? static_cast<unsigned short>(std::atoi(port_env)) : 50020;

    net::io_context ioc{1};
    tcp::acceptor acceptor{ioc, {tcp::v4(), port}};
    std::cout << "transcoding-service listening on :" << port << std::endl;

    for (;;) {
        tcp::socket socket{ioc};
        acceptor.accept(socket);
        std::thread{handle_session, std::move(socket)}.detach();
    }
    return 0;
}
