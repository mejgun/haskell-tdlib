-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Checks the validity of an invite link for a chat and returns information about the corresponding chat 
-- 
-- __invite_link__ Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
data CheckChatInviteLink = 

 CheckChatInviteLink { invite_link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CheckChatInviteLink where
 toJSON (CheckChatInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "checkChatInviteLink", "invite_link" A..= invite_link ]

instance T.FromJSON CheckChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChatInviteLink" -> parseCheckChatInviteLink v
   _ -> mempty
  where
   parseCheckChatInviteLink :: A.Value -> T.Parser CheckChatInviteLink
   parseCheckChatInviteLink = A.withObject "CheckChatInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ CheckChatInviteLink { invite_link = invite_link }