-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkCounts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatInviteLinkCount as ChatInviteLinkCount

-- |
-- 
-- Contains a list of chat invite link counts 
-- 
-- __invite_link_counts__ List of invite linkcounts
data ChatInviteLinkCounts = 

 ChatInviteLinkCounts { invite_link_counts :: Maybe [ChatInviteLinkCount.ChatInviteLinkCount] }  deriving (Show, Eq)

instance T.ToJSON ChatInviteLinkCounts where
 toJSON (ChatInviteLinkCounts { invite_link_counts = invite_link_counts }) =
  A.object [ "@type" A..= T.String "chatInviteLinkCounts", "invite_link_counts" A..= invite_link_counts ]

instance T.FromJSON ChatInviteLinkCounts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkCounts" -> parseChatInviteLinkCounts v
   _ -> mempty
  where
   parseChatInviteLinkCounts :: A.Value -> T.Parser ChatInviteLinkCounts
   parseChatInviteLinkCounts = A.withObject "ChatInviteLinkCounts" $ \o -> do
    invite_link_counts <- o A..:? "invite_link_counts"
    return $ ChatInviteLinkCounts { invite_link_counts = invite_link_counts }