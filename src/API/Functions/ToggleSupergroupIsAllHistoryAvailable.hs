-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsAllHistoryAvailable where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ToggleSupergroupIsAllHistoryAvailable = 
 ToggleSupergroupIsAllHistoryAvailable { is_all_history_available :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Show)

instance T.ToJSON ToggleSupergroupIsAllHistoryAvailable where
 toJSON (ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "toggleSupergroupIsAllHistoryAvailable", "is_all_history_available" A..= is_all_history_available, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON ToggleSupergroupIsAllHistoryAvailable where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSupergroupIsAllHistoryAvailable" -> parseToggleSupergroupIsAllHistoryAvailable v
   _ -> mempty
  where
   parseToggleSupergroupIsAllHistoryAvailable :: A.Value -> T.Parser ToggleSupergroupIsAllHistoryAvailable
   parseToggleSupergroupIsAllHistoryAvailable = A.withObject "ToggleSupergroupIsAllHistoryAvailable" $ \o -> do
    is_all_history_available <- optional $ o A..: "is_all_history_available"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id }