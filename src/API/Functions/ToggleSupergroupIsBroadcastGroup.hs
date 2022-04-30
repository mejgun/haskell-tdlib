-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupIsBroadcastGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup 
-- 
-- __supergroup_id__ Identifier of the supergroup
data ToggleSupergroupIsBroadcastGroup = 

 ToggleSupergroupIsBroadcastGroup { supergroup_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSupergroupIsBroadcastGroup where
 show ToggleSupergroupIsBroadcastGroup { supergroup_id=supergroup_id } =
  "ToggleSupergroupIsBroadcastGroup" ++ U.cc [U.p "supergroup_id" supergroup_id ]

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
