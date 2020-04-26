-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns current verbosity level of the internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously
data GetLogVerbosityLevel = 
 GetLogVerbosityLevel deriving (Show, Eq)

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