-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileMimeType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously 
-- 
-- __file_name__ The name of the file or path to the file
data GetFileMimeType = 

 GetFileMimeType { file_name :: Maybe String }  deriving (Eq)

instance Show GetFileMimeType where
 show GetFileMimeType { file_name=file_name } =
  "GetFileMimeType" ++ cc [p "file_name" file_name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetFileMimeType where
 toJSON GetFileMimeType { file_name = file_name } =
  A.object [ "@type" A..= T.String "getFileMimeType", "file_name" A..= file_name ]

instance T.FromJSON GetFileMimeType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileMimeType" -> parseGetFileMimeType v
   _ -> mempty
  where
   parseGetFileMimeType :: A.Value -> T.Parser GetFileMimeType
   parseGetFileMimeType = A.withObject "GetFileMimeType" $ \o -> do
    file_name <- o A..:? "file_name"
    return $ GetFileMimeType { file_name = file_name }
 parseJSON _ = mempty
