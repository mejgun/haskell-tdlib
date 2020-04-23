-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportSupergroupSpam where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReportSupergroupSpam = 
 ReportSupergroupSpam { message_ids :: Maybe [Int], user_id :: Maybe Int, supergroup_id :: Maybe Int }  deriving (Show)

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
    message_ids <- optional $ o A..: "message_ids"
    user_id <- optional $ o A..: "user_id"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ ReportSupergroupSpam { message_ids = message_ids, user_id = user_id, supergroup_id = supergroup_id }