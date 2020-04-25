-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisableProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DisableProxy = 
 DisableProxy deriving (Show, Eq)

instance T.ToJSON DisableProxy where
 toJSON (DisableProxy {  }) =
  A.object [ "@type" A..= T.String "disableProxy" ]

instance T.FromJSON DisableProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disableProxy" -> parseDisableProxy v
   _ -> mempty
  where
   parseDisableProxy :: A.Value -> T.Parser DisableProxy
   parseDisableProxy = A.withObject "DisableProxy" $ \o -> do
    return $ DisableProxy {  }