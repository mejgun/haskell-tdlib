-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsAllHistoryAvailable where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ToggleSupergroupIsAllHistoryAvailable = 
 ToggleSupergroupIsAllHistoryAvailable { is_all_history_available :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Show, Eq)

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
    is_all_history_available <- o A..:? "is_all_history_available"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id }