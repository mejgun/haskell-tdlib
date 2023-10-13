module TD.Data.CallServerType
  ( CallServerType(..)                     
  , defaultCallServerTypeTelegramReflector 
  , defaultCallServerTypeWebrtc            
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Describes the type of a call server
data CallServerType
  = CallServerTypeTelegramReflector -- ^ A Telegram call reflector
    { peer_tag :: Maybe BS.ByteString -- ^ A peer tag to be used with the reflector
    , is_tcp   :: Maybe Bool          -- ^ True, if the server uses TCP instead of UDP
    }
  | CallServerTypeWebrtc -- ^ A WebRTC server
    { username      :: Maybe T.Text -- ^ Username to be used for authentication
    , password      :: Maybe T.Text -- ^ Authentication password
    , supports_turn :: Maybe Bool   -- ^ True, if the server supports TURN
    , supports_stun :: Maybe Bool   -- ^ True, if the server supports STUN
    }
  deriving (Eq)

instance Show CallServerType where
  show CallServerTypeTelegramReflector
    { peer_tag = peer_tag_
    , is_tcp   = is_tcp_
    }
      = "CallServerTypeTelegramReflector"
        ++ I.cc
        [ "peer_tag" `I.p` peer_tag_
        , "is_tcp"   `I.p` is_tcp_
        ]
  show CallServerTypeWebrtc
    { username      = username_
    , password      = password_
    , supports_turn = supports_turn_
    , supports_stun = supports_stun_
    }
      = "CallServerTypeWebrtc"
        ++ I.cc
        [ "username"      `I.p` username_
        , "password"      `I.p` password_
        , "supports_turn" `I.p` supports_turn_
        , "supports_stun" `I.p` supports_stun_
        ]

instance AT.FromJSON CallServerType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callServerTypeTelegramReflector" -> parseCallServerTypeTelegramReflector v
      "callServerTypeWebrtc"            -> parseCallServerTypeWebrtc v
      _                                 -> mempty
    
    where
      parseCallServerTypeTelegramReflector :: A.Value -> AT.Parser CallServerType
      parseCallServerTypeTelegramReflector = A.withObject "CallServerTypeTelegramReflector" $ \o -> do
        peer_tag_ <- fmap I.readBytes <$> o A..:?  "peer_tag"
        is_tcp_   <- o A..:?                       "is_tcp"
        pure $ CallServerTypeTelegramReflector
          { peer_tag = peer_tag_
          , is_tcp   = is_tcp_
          }
      parseCallServerTypeWebrtc :: A.Value -> AT.Parser CallServerType
      parseCallServerTypeWebrtc = A.withObject "CallServerTypeWebrtc" $ \o -> do
        username_      <- o A..:?  "username"
        password_      <- o A..:?  "password"
        supports_turn_ <- o A..:?  "supports_turn"
        supports_stun_ <- o A..:?  "supports_stun"
        pure $ CallServerTypeWebrtc
          { username      = username_
          , password      = password_
          , supports_turn = supports_turn_
          , supports_stun = supports_stun_
          }
  parseJSON _ = mempty

instance AT.ToJSON CallServerType where
  toJSON CallServerTypeTelegramReflector
    { peer_tag = peer_tag_
    , is_tcp   = is_tcp_
    }
      = A.object
        [ "@type"    A..= AT.String "callServerTypeTelegramReflector"
        , "peer_tag" A..= fmap I.writeBytes  peer_tag_
        , "is_tcp"   A..= is_tcp_
        ]
  toJSON CallServerTypeWebrtc
    { username      = username_
    , password      = password_
    , supports_turn = supports_turn_
    , supports_stun = supports_stun_
    }
      = A.object
        [ "@type"         A..= AT.String "callServerTypeWebrtc"
        , "username"      A..= username_
        , "password"      A..= password_
        , "supports_turn" A..= supports_turn_
        , "supports_stun" A..= supports_stun_
        ]

defaultCallServerTypeTelegramReflector :: CallServerType
defaultCallServerTypeTelegramReflector =
  CallServerTypeTelegramReflector
    { peer_tag = Nothing
    , is_tcp   = Nothing
    }

defaultCallServerTypeWebrtc :: CallServerType
defaultCallServerTypeWebrtc =
  CallServerTypeWebrtc
    { username      = Nothing
    , password      = Nothing
    , supports_turn = Nothing
    , supports_stun = Nothing
    }

