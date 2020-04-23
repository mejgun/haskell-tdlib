-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogTagVerbosityLevel where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetLogTagVerbosityLevel = 
 SetLogTagVerbosityLevel { new_verbosity_level :: Maybe Int, tag :: Maybe String }  deriving (Show)

instance T.ToJSON SetLogTagVerbosityLevel where
 toJSON (SetLogTagVerbosityLevel { new_verbosity_level = new_verbosity_level, tag = tag }) =
  A.object [ "@type" A..= T.String "setLogTagVerbosityLevel", "new_verbosity_level" A..= new_verbosity_level, "tag" A..= tag ]

instance T.FromJSON SetLogTagVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setLogTagVerbosityLevel" -> parseSetLogTagVerbosityLevel v
   _ -> mempty
  where
   parseSetLogTagVerbosityLevel :: A.Value -> T.Parser SetLogTagVerbosityLevel
   parseSetLogTagVerbosityLevel = A.withObject "SetLogTagVerbosityLevel" $ \o -> do
    new_verbosity_level <- optional $ o A..: "new_verbosity_level"
    tag <- optional $ o A..: "tag"
    return $ SetLogTagVerbosityLevel { new_verbosity_level = new_verbosity_level, tag = tag }