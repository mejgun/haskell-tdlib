-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsAllHistoryAvailable where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ToggleSupergroupIsAllHistoryAvailable = 
 ToggleSupergroupIsAllHistoryAvailable { is_all_history_available :: Bool, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON ToggleSupergroupIsAllHistoryAvailable where
 toJSON (ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "toggleSupergroupIsAllHistoryAvailable", "is_all_history_available" A..= is_all_history_available, "supergroup_id" A..= supergroup_id ]
-- toggleSupergroupIsAllHistoryAvailable ToggleSupergroupIsAllHistoryAvailable  { is_all_history_available :: Bool, supergroup_id :: Int } 



instance T.FromJSON ToggleSupergroupIsAllHistoryAvailable where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSupergroupIsAllHistoryAvailable" -> parseToggleSupergroupIsAllHistoryAvailable v
  where
   parseToggleSupergroupIsAllHistoryAvailable :: A.Value -> T.Parser ToggleSupergroupIsAllHistoryAvailable
   parseToggleSupergroupIsAllHistoryAvailable = A.withObject "ToggleSupergroupIsAllHistoryAvailable" $ \o -> do
    is_all_history_available <- o A..: "is_all_history_available"
    supergroup_id <- o A..: "supergroup_id"
    return $ ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id }