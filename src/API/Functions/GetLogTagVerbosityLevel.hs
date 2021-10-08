-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTagVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously 
-- 
-- __tag__ Logging tag to change verbosity level
data GetLogTagVerbosityLevel = 

 GetLogTagVerbosityLevel { tag :: Maybe String }  deriving (Eq)

instance Show GetLogTagVerbosityLevel where
 show GetLogTagVerbosityLevel { tag=tag } =
  "GetLogTagVerbosityLevel" ++ cc [p "tag" tag ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLogTagVerbosityLevel where
 toJSON GetLogTagVerbosityLevel { tag = tag } =
  A.object [ "@type" A..= T.String "getLogTagVerbosityLevel", "tag" A..= tag ]

instance T.FromJSON GetLogTagVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogTagVerbosityLevel" -> parseGetLogTagVerbosityLevel v
   _ -> mempty
  where
   parseGetLogTagVerbosityLevel :: A.Value -> T.Parser GetLogTagVerbosityLevel
   parseGetLogTagVerbosityLevel = A.withObject "GetLogTagVerbosityLevel" $ \o -> do
    tag <- o A..:? "tag"
    return $ GetLogTagVerbosityLevel { tag = tag }
 parseJSON _ = mempty
