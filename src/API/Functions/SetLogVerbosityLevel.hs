-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetLogVerbosityLevel = 
 SetLogVerbosityLevel { new_verbosity_level :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetLogVerbosityLevel where
 toJSON (SetLogVerbosityLevel { new_verbosity_level = new_verbosity_level }) =
  A.object [ "@type" A..= T.String "setLogVerbosityLevel", "new_verbosity_level" A..= new_verbosity_level ]

instance T.FromJSON SetLogVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setLogVerbosityLevel" -> parseSetLogVerbosityLevel v
   _ -> mempty
  where
   parseSetLogVerbosityLevel :: A.Value -> T.Parser SetLogVerbosityLevel
   parseSetLogVerbosityLevel = A.withObject "SetLogVerbosityLevel" $ \o -> do
    new_verbosity_level <- mconcat [ o A..:? "new_verbosity_level", readMaybe <$> (o A..: "new_verbosity_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetLogVerbosityLevel { new_verbosity_level = new_verbosity_level }