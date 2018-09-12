//
//  Request+BaseURL.swift
//  App
//
//  Created by Maximilian Held on 12.09.18.
//

import Vapor

extension Request {
    var baseUrl: String {
        var host = http.headers["Host"].first ?? "" //don't do this in production
        host = host.finished(with: "/")
        let scheme = http.remotePeer.scheme ?? "http"
        return "\(scheme)://\(host)todos/"
    }
}
