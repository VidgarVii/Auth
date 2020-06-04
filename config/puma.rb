# frozen_string_literal: true

threads 1, 5
workers 2

bind AuthService.root.join('tmp', 'pid', 'puma.sock')
pidfile AuthService.root.join('tmp', 'pid', 'puma.pid')
