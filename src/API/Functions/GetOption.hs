-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetOption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization
-- 
-- __name__ The name of the option
data GetOption = 

 GetOption { name :: Maybe String }  deriving (Eq)

instance Show GetOption where
 show GetOption { name=name } =
  "GetOption" ++ cc [p "name" name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetOption where
 toJSON GetOption { name = name } =
  A.object [ "@type" A..= T.String "getOption", "name" A..= name ]

instance T.FromJSON GetOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getOption" -> parseGetOption v
   _ -> mempty
  where
   parseGetOption :: A.Value -> T.Parser GetOption
   parseGetOption = A.withObject "GetOption" $ \o -> do
    name <- o A..:? "name"
    return $ GetOption { name = name }
 parseJSON _ = mempty
