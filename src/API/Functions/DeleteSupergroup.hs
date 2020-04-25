-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSupergroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteSupergroup = 
 DeleteSupergroup { supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteSupergroup where
 toJSON (DeleteSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "deleteSupergroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON DeleteSupergroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSupergroup" -> parseDeleteSupergroup v
   _ -> mempty
  where
   parseDeleteSupergroup :: A.Value -> T.Parser DeleteSupergroup
   parseDeleteSupergroup = A.withObject "DeleteSupergroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteSupergroup { supergroup_id = supergroup_id }