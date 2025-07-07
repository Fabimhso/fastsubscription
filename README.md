# FastSubscription SaaS

FastSubscription is an MVP SaaS (Software as a Service) platform for subscription management, built with Ruby on Rails.

## Features

- User registration and authentication (Devise)
- Modern and responsive dashboard
- Subscription plan management (example: Free, Starter, Professional, Enterprise)
- Robust models: User, Plan, Subscription
- Premium UI (Tailwind CSS, glassmorphism, gradients)
- Custom login and registration screens
- Ready for Stripe integration (payments)
- Structure for admin area and API

## How it works

1. **User accesses the home page** and can register or log in.
2. **After login**, the user is redirected to the dashboard, where they see their current plan, subscription status, and can view/upgrade plans.
3. **Plans** are seeded and can be expanded for real Stripe integration.
4. **Subscriptions** are linked to users and plans, allowing upgrades, downgrades, and cancellations.
5. **Modern UI**: all main screens use Tailwind CSS, with responsiveness and professional visual effects.

## How to run locally

1. **Requirements:**
   - Ruby 3.4+
   - Rails 8+
   - PostgreSQL
   - Node.js and Yarn (for assets)

2. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd subscription_saas
   ```

3. **Install dependencies:**
   ```bash
   bundle install
   yarn install --check-files || true
   ```

4. **Configure the database:**
   - Edit `config/database.yml` with your PostgreSQL user and password (default: user `postgres`, password `1234`)
   - Create and migrate the database:
   ```bash
   rails db:create db:migrate db:seed
   ```

5. **Run the development server:**
   ```bash
   bin/dev
   # or
   rails server
   rails tailwindcss:build
   ```

6. **Access:**
   - [http://localhost:3000](http://localhost:3000)

## Directory structure

- `app/models` — Main models: User, Plan, Subscription
- `app/views` — Custom screens (login, registration, dashboard)
- `db/seeds.rb` — Example plans
- `config/routes.rb` — Main routes

## Customization
- To add new plans, edit `db/seeds.rb`.
- To integrate real payments, configure the Stripe gem and adjust the Subscription model.
- To customize the UI, edit files in `app/views` and Tailwind CSS in `app/assets/tailwind/application.css`.

## Suggested roadmap
- Stripe integration (checkout and webhooks)
- Admin area
- REST API for external integrations
- Email notifications
- Automated tests (RSpec)

---

Developed by Fabiano Oliveira, Ruby Engineer.
