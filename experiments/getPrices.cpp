/// Gets the prices from FXCM

#include <IO2GTransport.h>

#include <memory>

namespace fxcm {

// Session
struct SessionSentinel {
  IO2GSession *session = CO2GTransport::createSession();
  ~SessionSentinel() { session->release(); }
  IOTGSession& operator ->() { return *session; }
};

// Session listener
struct SessionListenerSentinel {
  SessionSentinal &session;
  SessionStatusListener *sessionListener;
  SessionListenerSentinel(SessionSentinal session) : session(session) {
    sessionListener = new SessionStatusListener(session, true, 0, 0);
    session->subscribeSessionStatus(sessionListener);
  }
  ~SessionStatusListener() {
    session->unsubscribeSessionStatus(sessionListener);
    sessionListener->release();
  }
  SessionStatusListener &operator->() { return *sessionListener; }
};

}

int main(int argc, char** argv) {
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " session_id pin" << std::endl;
    return 1;
  }
  std::string sessionID = argv[1];
  std::string pin = argv[2];
  SessionSentinel session;
  SessionListenerSentinel listener(session, session_id, pin);
  // Login
  listener->reset();
  session->login(login, password, url, connection);
  bool logged_in =  statusListener->waitEvents() && statusListener->isConnected();

  
  return 0;
}

