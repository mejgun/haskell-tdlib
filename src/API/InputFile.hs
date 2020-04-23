-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data InputFile = 
 InputFileId { __id :: Maybe Int }  
 | InputFileRemote { _id :: Maybe String }  
 | InputFileLocal { path :: Maybe String }  
 | InputFileGenerated { expected_size :: Maybe Int, conversion :: Maybe String, original_path :: Maybe String }  deriving (Show)

instance T.ToJSON InputFile where
 toJSON (InputFileId { __id = __id }) =
  A.object [ "@type" A..= T.String "inputFileId", "id" A..= __id ]

 toJSON (InputFileRemote { _id = _id }) =
  A.object [ "@type" A..= T.String "inputFileRemote", "id" A..= _id ]

 toJSON (InputFileLocal { path = path }) =
  A.object [ "@type" A..= T.String "inputFileLocal", "path" A..= path ]

 toJSON (InputFileGenerated { expected_size = expected_size, conversion = conversion, original_path = original_path }) =
  A.object [ "@type" A..= T.String "inputFileGenerated", "expected_size" A..= expected_size, "conversion" A..= conversion, "original_path" A..= original_path ]

instance T.FromJSON InputFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputFileId" -> parseInputFileId v
   "inputFileRemote" -> parseInputFileRemote v
   "inputFileLocal" -> parseInputFileLocal v
   "inputFileGenerated" -> parseInputFileGenerated v
   _ -> mempty
  where
   parseInputFileId :: A.Value -> T.Parser InputFile
   parseInputFileId = A.withObject "InputFileId" $ \o -> do
    __id <- optional $ o A..: "id"
    return $ InputFileId { __id = __id }

   parseInputFileRemote :: A.Value -> T.Parser InputFile
   parseInputFileRemote = A.withObject "InputFileRemote" $ \o -> do
    _id <- optional $ o A..: "id"
    return $ InputFileRemote { _id = _id }

   parseInputFileLocal :: A.Value -> T.Parser InputFile
   parseInputFileLocal = A.withObject "InputFileLocal" $ \o -> do
    path <- optional $ o A..: "path"
    return $ InputFileLocal { path = path }

   parseInputFileGenerated :: A.Value -> T.Parser InputFile
   parseInputFileGenerated = A.withObject "InputFileGenerated" $ \o -> do
    expected_size <- optional $ o A..: "expected_size"
    conversion <- optional $ o A..: "conversion"
    original_path <- optional $ o A..: "original_path"
    return $ InputFileGenerated { expected_size = expected_size, conversion = conversion, original_path = original_path }