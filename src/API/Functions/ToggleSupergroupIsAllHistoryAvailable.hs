-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsAllHistoryAvailable where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Toggles whether the message history of a supergroup is available to new members; requires can_change_info administrator right 
-- 
-- __supergroup_id__ The identifier of the supergroup
-- 
-- __is_all_history_available__ The new value of is_all_history_available
data ToggleSupergroupIsAllHistoryAvailable = 

 ToggleSupergroupIsAllHistoryAvailable { is_all_history_available :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSupergroupIsAllHistoryAvailable where
 show ToggleSupergroupIsAllHistoryAvailable { is_all_history_available=is_all_history_available, supergroup_id=supergroup_id } =
  "ToggleSupergroupIsAllHistoryAvailable" ++ cc [p "is_all_history_available" is_all_history_available, p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleSupergroupIsAllHistoryAvailable where
 toJSON ToggleSupergroupIsAllHistoryAvailable { is_all_history_available = is_all_history_available, supergroup_id = supergroup_id } =
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
 parseJSON _ = mempty
