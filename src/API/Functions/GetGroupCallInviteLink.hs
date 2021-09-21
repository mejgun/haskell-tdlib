-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupCallInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns invite link to a voice chat in a public chat
-- 
-- __group_call_id__ Group call identifier
-- 
-- __can_self_unmute__ Pass true if the invite_link should contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
data GetGroupCallInviteLink = 

 GetGroupCallInviteLink { can_self_unmute :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetGroupCallInviteLink where
 toJSON (GetGroupCallInviteLink { can_self_unmute = can_self_unmute, group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "getGroupCallInviteLink", "can_self_unmute" A..= can_self_unmute, "group_call_id" A..= group_call_id ]

instance T.FromJSON GetGroupCallInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupCallInviteLink" -> parseGetGroupCallInviteLink v
   _ -> mempty
  where
   parseGetGroupCallInviteLink :: A.Value -> T.Parser GetGroupCallInviteLink
   parseGetGroupCallInviteLink = A.withObject "GetGroupCallInviteLink" $ \o -> do
    can_self_unmute <- o A..:? "can_self_unmute"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGroupCallInviteLink { can_self_unmute = can_self_unmute, group_call_id = group_call_id }