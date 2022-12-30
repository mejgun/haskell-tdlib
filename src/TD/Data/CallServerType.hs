{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallServerType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of a call server
data CallServerType
  = -- | A Telegram call reflector @peer_tag A peer tag to be used with the reflector @is_tcp True, if the server uses TCP instead of UDP
    CallServerTypeTelegramReflector
      { -- |
        is_tcp :: Maybe Bool,
        -- |
        peer_tag :: Maybe String
      }
  | -- | A WebRTC server
    CallServerTypeWebrtc
      { -- | True, if the server supports STUN
        supports_stun :: Maybe Bool,
        -- | True, if the server supports TURN
        supports_turn :: Maybe Bool,
        -- | Authentication password
        password :: Maybe String,
        -- | Username to be used for authentication
        username :: Maybe String
      }
  deriving (Eq)

instance Show CallServerType where
  show
    CallServerTypeTelegramReflector
      { is_tcp = is_tcp_,
        peer_tag = peer_tag_
      } =
      "CallServerTypeTelegramReflector"
        ++ U.cc
          [ U.p "is_tcp" is_tcp_,
            U.p "peer_tag" peer_tag_
          ]
  show
    CallServerTypeWebrtc
      { supports_stun = supports_stun_,
        supports_turn = supports_turn_,
        password = password_,
        username = username_
      } =
      "CallServerTypeWebrtc"
        ++ U.cc
          [ U.p "supports_stun" supports_stun_,
            U.p "supports_turn" supports_turn_,
            U.p "password" password_,
            U.p "username" username_
          ]

instance T.FromJSON CallServerType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callServerTypeTelegramReflector" -> parseCallServerTypeTelegramReflector v
      "callServerTypeWebrtc" -> parseCallServerTypeWebrtc v
      _ -> mempty
    where
      parseCallServerTypeTelegramReflector :: A.Value -> T.Parser CallServerType
      parseCallServerTypeTelegramReflector = A.withObject "CallServerTypeTelegramReflector" $ \o -> do
        is_tcp_ <- o A..:? "is_tcp"
        peer_tag_ <- o A..:? "peer_tag"
        return $ CallServerTypeTelegramReflector {is_tcp = is_tcp_, peer_tag = peer_tag_}

      parseCallServerTypeWebrtc :: A.Value -> T.Parser CallServerType
      parseCallServerTypeWebrtc = A.withObject "CallServerTypeWebrtc" $ \o -> do
        supports_stun_ <- o A..:? "supports_stun"
        supports_turn_ <- o A..:? "supports_turn"
        password_ <- o A..:? "password"
        username_ <- o A..:? "username"
        return $ CallServerTypeWebrtc {supports_stun = supports_stun_, supports_turn = supports_turn_, password = password_, username = username_}
  parseJSON _ = mempty

instance T.ToJSON CallServerType where
  toJSON
    CallServerTypeTelegramReflector
      { is_tcp = is_tcp_,
        peer_tag = peer_tag_
      } =
      A.object
        [ "@type" A..= T.String "callServerTypeTelegramReflector",
          "is_tcp" A..= is_tcp_,
          "peer_tag" A..= peer_tag_
        ]
  toJSON
    CallServerTypeWebrtc
      { supports_stun = supports_stun_,
        supports_turn = supports_turn_,
        password = password_,
        username = username_
      } =
      A.object
        [ "@type" A..= T.String "callServerTypeWebrtc",
          "supports_stun" A..= supports_stun_,
          "supports_turn" A..= supports_turn_,
          "password" A..= password_,
          "username" A..= username_
        ]
