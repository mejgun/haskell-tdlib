-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileExtension where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously 
-- 
-- __mime_type__ The MIME type of the file
data GetFileExtension = 

 GetFileExtension { mime_type :: Maybe String }  deriving (Eq)

instance Show GetFileExtension where
 show GetFileExtension { mime_type=mime_type } =
  "GetFileExtension" ++ U.cc [U.p "mime_type" mime_type ]

instance T.ToJSON GetFileExtension where
 toJSON GetFileExtension { mime_type = mime_type } =
  A.object [ "@type" A..= T.String "getFileExtension", "mime_type" A..= mime_type ]

instance T.FromJSON GetFileExtension where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileExtension" -> parseGetFileExtension v
   _ -> mempty
  where
   parseGetFileExtension :: A.Value -> T.Parser GetFileExtension
   parseGetFileExtension = A.withObject "GetFileExtension" $ \o -> do
    mime_type <- o A..:? "mime_type"
    return $ GetFileExtension { mime_type = mime_type }
 parseJSON _ = mempty
