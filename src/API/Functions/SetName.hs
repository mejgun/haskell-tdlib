-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetName = 
 SetName { last_name :: Maybe String, first_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SetName where
 toJSON (SetName { last_name = last_name, first_name = first_name }) =
  A.object [ "@type" A..= T.String "setName", "last_name" A..= last_name, "first_name" A..= first_name ]

instance T.FromJSON SetName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setName" -> parseSetName v
   _ -> mempty
  where
   parseSetName :: A.Value -> T.Parser SetName
   parseSetName = A.withObject "SetName" $ \o -> do
    last_name <- o A..:? "last_name"
    first_name <- o A..:? "first_name"
    return $ SetName { last_name = last_name, first_name = first_name }