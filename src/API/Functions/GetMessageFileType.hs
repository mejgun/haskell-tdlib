-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageFileType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a file with messages exported from another app 
-- 
-- __message_file_head__ Beginning of the message file; up to 100 first lines
data GetMessageFileType = 

 GetMessageFileType { message_file_head :: Maybe String }  deriving (Eq)

instance Show GetMessageFileType where
 show GetMessageFileType { message_file_head=message_file_head } =
  "GetMessageFileType" ++ cc [p "message_file_head" message_file_head ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageFileType where
 toJSON GetMessageFileType { message_file_head = message_file_head } =
  A.object [ "@type" A..= T.String "getMessageFileType", "message_file_head" A..= message_file_head ]

instance T.FromJSON GetMessageFileType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageFileType" -> parseGetMessageFileType v
   _ -> mempty
  where
   parseGetMessageFileType :: A.Value -> T.Parser GetMessageFileType
   parseGetMessageFileType = A.withObject "GetMessageFileType" $ \o -> do
    message_file_head <- o A..:? "message_file_head"
    return $ GetMessageFileType { message_file_head = message_file_head }
 parseJSON _ = mempty
