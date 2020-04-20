-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportSupergroupSpam where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ReportSupergroupSpam = 
 ReportSupergroupSpam { message_ids :: [Int], user_id :: Int, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON ReportSupergroupSpam where
 toJSON (ReportSupergroupSpam { message_ids = message_ids, user_id = user_id, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "reportSupergroupSpam", "message_ids" A..= message_ids, "user_id" A..= user_id, "supergroup_id" A..= supergroup_id ]
-- reportSupergroupSpam ReportSupergroupSpam  { message_ids :: [Int], user_id :: Int, supergroup_id :: Int } 

