-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogVerbosityLevel where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLogVerbosityLevel = 
 GetLogVerbosityLevel deriving (Show)

instance T.ToJSON GetLogVerbosityLevel where
 toJSON (GetLogVerbosityLevel {  }) =
  A.object [ "@type" A..= T.String "getLogVerbosityLevel" ]

instance T.FromJSON GetLogVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogVerbosityLevel" -> parseGetLogVerbosityLevel v
   _ -> mempty
  where
   parseGetLogVerbosityLevel :: A.Value -> T.Parser GetLogVerbosityLevel
   parseGetLogVerbosityLevel = A.withObject "GetLogVerbosityLevel" $ \o -> do
    return $ GetLogVerbosityLevel {  }