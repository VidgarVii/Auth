# frozen_string_literal: true

threads 1, 5
workers 2

bind Application.root.join('tmp', 'pid', 'puma.sock')
pidfile Application.root.join('tmp', 'pid', 'puma.pid')
