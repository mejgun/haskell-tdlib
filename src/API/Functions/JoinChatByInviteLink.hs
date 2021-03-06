-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinChatByInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server
-- 
-- __invite_link__ Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
data JoinChatByInviteLink = 

 JoinChatByInviteLink { invite_link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON JoinChatByInviteLink where
 toJSON (JoinChatByInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "joinChatByInviteLink", "invite_link" A..= invite_link ]

instance T.FromJSON JoinChatByInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "joinChatByInviteLink" -> parseJoinChatByInviteLink v
   _ -> mempty
  where
   parseJoinChatByInviteLink :: A.Value -> T.Parser JoinChatByInviteLink
   parseJoinChatByInviteLink = A.withObject "JoinChatByInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ JoinChatByInviteLink { invite_link = invite_link }