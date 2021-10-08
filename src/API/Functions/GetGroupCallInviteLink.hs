-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupCallInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns invite link to a voice chat in a public chat
-- 
-- __group_call_id__ Group call identifier
-- 
-- __can_self_unmute__ Pass true if the invite link needs to contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
data GetGroupCallInviteLink = 

 GetGroupCallInviteLink { can_self_unmute :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show GetGroupCallInviteLink where
 show GetGroupCallInviteLink { can_self_unmute=can_self_unmute, group_call_id=group_call_id } =
  "GetGroupCallInviteLink" ++ cc [p "can_self_unmute" can_self_unmute, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetGroupCallInviteLink where
 toJSON GetGroupCallInviteLink { can_self_unmute = can_self_unmute, group_call_id = group_call_id } =
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
 parseJSON _ = mempty
