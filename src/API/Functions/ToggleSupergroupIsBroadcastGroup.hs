-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsBroadcastGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup 
-- 
-- __supergroup_id__ Identifier of the supergroup
data ToggleSupergroupIsBroadcastGroup = 

 ToggleSupergroupIsBroadcastGroup { supergroup_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSupergroupIsBroadcastGroup where
 show ToggleSupergroupIsBroadcastGroup { supergroup_id=supergroup_id } =
  "ToggleSupergroupIsBroadcastGroup" ++ cc [p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleSupergroupIsBroadcastGroup where
 toJSON ToggleSupergroupIsBroadcastGroup { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "toggleSupergroupIsBroadcastGroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON ToggleSupergroupIsBroadcastGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSupergroupIsBroadcastGroup" -> parseToggleSupergroupIsBroadcastGroup v
   _ -> mempty
  where
   parseToggleSupergroupIsBroadcastGroup :: A.Value -> T.Parser ToggleSupergroupIsBroadcastGroup
   parseToggleSupergroupIsBroadcastGroup = A.withObject "ToggleSupergroupIsBroadcastGroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleSupergroupIsBroadcastGroup { supergroup_id = supergroup_id }
 parseJSON _ = mempty
