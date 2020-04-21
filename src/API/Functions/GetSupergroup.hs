-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetSupergroup = 
 GetSupergroup { supergroup_id :: Int }  deriving (Show)

instance T.ToJSON GetSupergroup where
 toJSON (GetSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON GetSupergroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupergroup" -> parseGetSupergroup v
   _ -> mempty
  where
   parseGetSupergroup :: A.Value -> T.Parser GetSupergroup
   parseGetSupergroup = A.withObject "GetSupergroup" $ \o -> do
    supergroup_id <- o A..: "supergroup_id"
    return $ GetSupergroup { supergroup_id = supergroup_id }