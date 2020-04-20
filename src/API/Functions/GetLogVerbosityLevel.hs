-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogVerbosityLevel = 
 GetLogVerbosityLevel -- deriving (Show)

instance T.ToJSON GetLogVerbosityLevel where
 toJSON (GetLogVerbosityLevel {  }) =
  A.object [ "@type" A..= T.String "getLogVerbosityLevel" ]
-- getLogVerbosityLevel GetLogVerbosityLevel 



instance T.FromJSON GetLogVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogVerbosityLevel" -> parseGetLogVerbosityLevel v
  where
   parseGetLogVerbosityLevel :: A.Value -> T.Parser GetLogVerbosityLevel
   parseGetLogVerbosityLevel = A.withObject "GetLogVerbosityLevel" $ \o -> do
    return $ GetLogVerbosityLevel {  }