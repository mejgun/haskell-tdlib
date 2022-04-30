-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogTagVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
-- 
-- __tag__ Logging tag to change verbosity level
-- 
-- __new_verbosity_level__ New verbosity level; 1-1024
data SetLogTagVerbosityLevel = 

 SetLogTagVerbosityLevel { new_verbosity_level :: Maybe Int, tag :: Maybe String }  deriving (Eq)

instance Show SetLogTagVerbosityLevel where
 show SetLogTagVerbosityLevel { new_verbosity_level=new_verbosity_level, tag=tag } =
  "SetLogTagVerbosityLevel" ++ U.cc [U.p "new_verbosity_level" new_verbosity_level, U.p "tag" tag ]

instance T.ToJSON SetLogTagVerbosityLevel where
 toJSON SetLogTagVerbosityLevel { new_verbosity_level = new_verbosity_level, tag = tag } =
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
    new_verbosity_level <- mconcat [ o A..:? "new_verbosity_level", readMaybe <$> (o A..: "new_verbosity_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    tag <- o A..:? "tag"
    return $ SetLogTagVerbosityLevel { new_verbosity_level = new_verbosity_level, tag = tag }
 parseJSON _ = mempty
