-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckChatInviteLink = 
 CheckChatInviteLink { invite_link :: String }  -- deriving (Show)

instance T.ToJSON CheckChatInviteLink where
 toJSON (CheckChatInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "checkChatInviteLink", "invite_link" A..= invite_link ]
-- checkChatInviteLink CheckChatInviteLink  { invite_link :: String } 



instance T.FromJSON CheckChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChatInviteLink" -> parseCheckChatInviteLink v
  where
   parseCheckChatInviteLink :: A.Value -> T.Parser CheckChatInviteLink
   parseCheckChatInviteLink = A.withObject "CheckChatInviteLink" $ \o -> do
    invite_link <- o A..: "invite_link"
    return $ CheckChatInviteLink { invite_link = invite_link }