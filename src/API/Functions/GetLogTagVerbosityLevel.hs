-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogTagVerbosityLevel = 
 GetLogTagVerbosityLevel { tag :: String }  -- deriving (Show)

instance T.ToJSON GetLogTagVerbosityLevel where
 toJSON (GetLogTagVerbosityLevel { tag = tag }) =
  A.object [ "@type" A..= T.String "getLogTagVerbosityLevel", "tag" A..= tag ]
-- getLogTagVerbosityLevel GetLogTagVerbosityLevel  { tag :: String } 



instance T.FromJSON GetLogTagVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogTagVerbosityLevel" -> parseGetLogTagVerbosityLevel v
  where
   parseGetLogTagVerbosityLevel :: A.Value -> T.Parser GetLogTagVerbosityLevel
   parseGetLogTagVerbosityLevel = A.withObject "GetLogTagVerbosityLevel" $ \o -> do
    tag <- o A..: "tag"
    return $ GetLogTagVerbosityLevel { tag = tag }