-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatInviteLink = 
 ChatInviteLink { invite_link :: String }  deriving (Show)

instance T.ToJSON ChatInviteLink where
 toJSON (ChatInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatInviteLink", "invite_link" A..= invite_link ]

instance T.FromJSON ChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLink" -> parseChatInviteLink v
   _ -> mempty
  where
   parseChatInviteLink :: A.Value -> T.Parser ChatInviteLink
   parseChatInviteLink = A.withObject "ChatInviteLink" $ \o -> do
    invite_link <- o A..: "invite_link"
    return $ ChatInviteLink { invite_link = invite_link }