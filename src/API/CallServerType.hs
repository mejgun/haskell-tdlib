-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallServerType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes the type of a call server
data CallServerType = 
 -- |
 -- 
 -- A Telegram call reflector 
 -- 
 -- __peer_tag__ A peer tag to be used with the reflector
 CallServerTypeTelegramReflector { peer_tag :: Maybe String }  |
 -- |
 -- 
 -- A WebRTC server 
 -- 
 -- __username__ Username to be used for authentication
 -- 
 -- __password__ Authentication password
 -- 
 -- __supports_turn__ True, if the server supports TURN
 -- 
 -- __supports_stun__ True, if the server supports STUN
 CallServerTypeWebrtc { supports_stun :: Maybe Bool, supports_turn :: Maybe Bool, password :: Maybe String, username :: Maybe String }  deriving (Eq)

instance Show CallServerType where
 show CallServerTypeTelegramReflector { peer_tag=peer_tag } =
  "CallServerTypeTelegramReflector" ++ U.cc [U.p "peer_tag" peer_tag ]

 show CallServerTypeWebrtc { supports_stun=supports_stun, supports_turn=supports_turn, password=password, username=username } =
  "CallServerTypeWebrtc" ++ U.cc [U.p "supports_stun" supports_stun, U.p "supports_turn" supports_turn, U.p "password" password, U.p "username" username ]

instance T.ToJSON CallServerType where
 toJSON CallServerTypeTelegramReflector { peer_tag = peer_tag } =
  A.object [ "@type" A..= T.String "callServerTypeTelegramReflector", "peer_tag" A..= peer_tag ]

 toJSON CallServerTypeWebrtc { supports_stun = supports_stun, supports_turn = supports_turn, password = password, username = username } =
  A.object [ "@type" A..= T.String "callServerTypeWebrtc", "supports_stun" A..= supports_stun, "supports_turn" A..= supports_turn, "password" A..= password, "username" A..= username ]

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
    peer_tag <- o A..:? "peer_tag"
    return $ CallServerTypeTelegramReflector { peer_tag = peer_tag }

   parseCallServerTypeWebrtc :: A.Value -> T.Parser CallServerType
   parseCallServerTypeWebrtc = A.withObject "CallServerTypeWebrtc" $ \o -> do
    supports_stun <- o A..:? "supports_stun"
    supports_turn <- o A..:? "supports_turn"
    password <- o A..:? "password"
    username <- o A..:? "username"
    return $ CallServerTypeWebrtc { supports_stun = supports_stun, supports_turn = supports_turn, password = password, username = username }
 parseJSON _ = mempty
