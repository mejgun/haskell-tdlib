-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
data GetLogVerbosityLevel = 

 GetLogVerbosityLevel deriving (Eq)

instance Show GetLogVerbosityLevel where
 show GetLogVerbosityLevel {  } =
  "GetLogVerbosityLevel" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLogVerbosityLevel where
 toJSON GetLogVerbosityLevel {  } =
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
 parseJSON _ = mempty
