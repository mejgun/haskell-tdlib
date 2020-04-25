-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportSupergroupSpam where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReportSupergroupSpam = 
 ReportSupergroupSpam { message_ids :: Maybe [Int], user_id :: Maybe Int, supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ReportSupergroupSpam where
 toJSON (ReportSupergroupSpam { message_ids = message_ids, user_id = user_id, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "reportSupergroupSpam", "message_ids" A..= message_ids, "user_id" A..= user_id, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON ReportSupergroupSpam where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reportSupergroupSpam" -> parseReportSupergroupSpam v
   _ -> mempty
  where
   parseReportSupergroupSpam :: A.Value -> T.Parser ReportSupergroupSpam
   parseReportSupergroupSpam = A.withObject "ReportSupergroupSpam" $ \o -> do
    message_ids <- o A..:? "message_ids"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReportSupergroupSpam { message_ids = message_ids, user_id = user_id, supergroup_id = supergroup_id }