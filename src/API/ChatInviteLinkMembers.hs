-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatInviteLinkMember as ChatInviteLinkMember

-- |
-- 
-- Contains a list of chat members joined a chat by an invite link 
-- 
-- __total_count__ Approximate total count of chat members found
-- 
-- __members__ List of chat members, joined a chat by an invite link
data ChatInviteLinkMembers = 

 ChatInviteLinkMembers { members :: Maybe [ChatInviteLinkMember.ChatInviteLinkMember], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatInviteLinkMembers where
 toJSON (ChatInviteLinkMembers { members = members, total_count = total_count }) =
  A.object [ "@type" A..= T.String "chatInviteLinkMembers", "members" A..= members, "total_count" A..= total_count ]

instance T.FromJSON ChatInviteLinkMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkMembers" -> parseChatInviteLinkMembers v
   _ -> mempty
  where
   parseChatInviteLinkMembers :: A.Value -> T.Parser ChatInviteLinkMembers
   parseChatInviteLinkMembers = A.withObject "ChatInviteLinkMembers" $ \o -> do
    members <- o A..:? "members"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinkMembers { members = members, total_count = total_count }