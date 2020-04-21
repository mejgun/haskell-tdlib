-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetOption = 
 GetOption { name :: String }  deriving (Show)

instance T.ToJSON GetOption where
 toJSON (GetOption { name = name }) =
  A.object [ "@type" A..= T.String "getOption", "name" A..= name ]

instance T.FromJSON GetOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getOption" -> parseGetOption v
   _ -> mempty
  where
   parseGetOption :: A.Value -> T.Parser GetOption
   parseGetOption = A.withObject "GetOption" $ \o -> do
    name <- o A..: "name"
    return $ GetOption { name = name }