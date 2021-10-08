-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.InviteGroupCallParticipants where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Invites users to an active group call. Sends a service message of type messageInviteToGroupCall for voice chats
-- 
-- __group_call_id__ Group call identifier
-- 
-- __user_ids__ User identifiers. At most 10 users can be invited simultaneously
data InviteGroupCallParticipants = 

 InviteGroupCallParticipants { user_ids :: Maybe [Int], group_call_id :: Maybe Int }  deriving (Eq)

instance Show InviteGroupCallParticipants where
 show InviteGroupCallParticipants { user_ids=user_ids, group_call_id=group_call_id } =
  "InviteGroupCallParticipants" ++ cc [p "user_ids" user_ids, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InviteGroupCallParticipants where
 toJSON InviteGroupCallParticipants { user_ids = user_ids, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "inviteGroupCallParticipants", "user_ids" A..= user_ids, "group_call_id" A..= group_call_id ]

instance T.FromJSON InviteGroupCallParticipants where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inviteGroupCallParticipants" -> parseInviteGroupCallParticipants v
   _ -> mempty
  where
   parseInviteGroupCallParticipants :: A.Value -> T.Parser InviteGroupCallParticipants
   parseInviteGroupCallParticipants = A.withObject "InviteGroupCallParticipants" $ \o -> do
    user_ids <- o A..:? "user_ids"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InviteGroupCallParticipants { user_ids = user_ids, group_call_id = group_call_id }
 parseJSON _ = mempty
