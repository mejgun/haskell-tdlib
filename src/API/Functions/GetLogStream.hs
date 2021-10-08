-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogStream where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
data GetLogStream = 

 GetLogStream deriving (Eq)

instance Show GetLogStream where
 show GetLogStream {  } =
  "GetLogStream" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLogStream where
 toJSON GetLogStream {  } =
  A.object [ "@type" A..= T.String "getLogStream" ]

instance T.FromJSON GetLogStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogStream" -> parseGetLogStream v
   _ -> mempty
  where
   parseGetLogStream :: A.Value -> T.Parser GetLogStream
   parseGetLogStream = A.withObject "GetLogStream" $ \o -> do
    return $ GetLogStream {  }
 parseJSON _ = mempty
