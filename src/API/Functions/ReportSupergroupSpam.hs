-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportSupergroupSpam where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Reports messages in a supergroup as spam; requires administrator rights in the supergroup 
-- 
-- __supergroup_id__ Supergroup identifier
-- 
-- __message_ids__ Identifiers of messages to report
data ReportSupergroupSpam = 

 ReportSupergroupSpam { message_ids :: Maybe [Int], supergroup_id :: Maybe Int }  deriving (Eq)

instance Show ReportSupergroupSpam where
 show ReportSupergroupSpam { message_ids=message_ids, supergroup_id=supergroup_id } =
  "ReportSupergroupSpam" ++ cc [p "message_ids" message_ids, p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReportSupergroupSpam where
 toJSON ReportSupergroupSpam { message_ids = message_ids, supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "reportSupergroupSpam", "message_ids" A..= message_ids, "supergroup_id" A..= supergroup_id ]

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
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReportSupergroupSpam { message_ids = message_ids, supergroup_id = supergroup_id }
 parseJSON _ = mempty
