-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogVerbosityLevel where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LogVerbosityLevel = 
 LogVerbosityLevel { verbosity_level :: Maybe Int }  deriving (Show)

instance T.ToJSON LogVerbosityLevel where
 toJSON (LogVerbosityLevel { verbosity_level = verbosity_level }) =
  A.object [ "@type" A..= T.String "logVerbosityLevel", "verbosity_level" A..= verbosity_level ]

instance T.FromJSON LogVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logVerbosityLevel" -> parseLogVerbosityLevel v
   _ -> mempty
  where
   parseLogVerbosityLevel :: A.Value -> T.Parser LogVerbosityLevel
   parseLogVerbosityLevel = A.withObject "LogVerbosityLevel" $ \o -> do
    verbosity_level <- optional $ o A..: "verbosity_level"
    return $ LogVerbosityLevel { verbosity_level = verbosity_level }