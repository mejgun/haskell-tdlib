-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsAdministratorActionsInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains statistics about administrator actions done by a user
-- 
-- __user_id__ Administrator user identifier
-- 
-- __deleted_message_count__ Number of messages deleted by the administrator
-- 
-- __banned_user_count__ Number of users banned by the administrator
-- 
-- __restricted_user_count__ Number of users restricted by the administrator
data ChatStatisticsAdministratorActionsInfo = 

 ChatStatisticsAdministratorActionsInfo { restricted_user_count :: Maybe Int, banned_user_count :: Maybe Int, deleted_message_count :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show ChatStatisticsAdministratorActionsInfo where
 show ChatStatisticsAdministratorActionsInfo { restricted_user_count=restricted_user_count, banned_user_count=banned_user_count, deleted_message_count=deleted_message_count, user_id=user_id } =
  "ChatStatisticsAdministratorActionsInfo" ++ cc [p "restricted_user_count" restricted_user_count, p "banned_user_count" banned_user_count, p "deleted_message_count" deleted_message_count, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatStatisticsAdministratorActionsInfo where
 toJSON ChatStatisticsAdministratorActionsInfo { restricted_user_count = restricted_user_count, banned_user_count = banned_user_count, deleted_message_count = deleted_message_count, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatStatisticsAdministratorActionsInfo", "restricted_user_count" A..= restricted_user_count, "banned_user_count" A..= banned_user_count, "deleted_message_count" A..= deleted_message_count, "user_id" A..= user_id ]

instance T.FromJSON ChatStatisticsAdministratorActionsInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsAdministratorActionsInfo" -> parseChatStatisticsAdministratorActionsInfo v
   _ -> mempty
  where
   parseChatStatisticsAdministratorActionsInfo :: A.Value -> T.Parser ChatStatisticsAdministratorActionsInfo
   parseChatStatisticsAdministratorActionsInfo = A.withObject "ChatStatisticsAdministratorActionsInfo" $ \o -> do
    restricted_user_count <- mconcat [ o A..:? "restricted_user_count", readMaybe <$> (o A..: "restricted_user_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    banned_user_count <- mconcat [ o A..:? "banned_user_count", readMaybe <$> (o A..: "banned_user_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    deleted_message_count <- mconcat [ o A..:? "deleted_message_count", readMaybe <$> (o A..: "deleted_message_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatStatisticsAdministratorActionsInfo { restricted_user_count = restricted_user_count, banned_user_count = banned_user_count, deleted_message_count = deleted_message_count, user_id = user_id }
 parseJSON _ = mempty
