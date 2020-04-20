-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data InputFile = 
 InputFileId { __id :: Int }  
 | InputFileRemote { _id :: String }  
 | InputFileLocal { path :: String }  
 | InputFileGenerated { expected_size :: Int, conversion :: String, original_path :: String }  -- deriving (Show)

instance T.ToJSON InputFile where
 toJSON (InputFileId { __id = __id }) =
  A.object [ "@type" A..= T.String "inputFileId", "id" A..= __id ]

 toJSON (InputFileRemote { _id = _id }) =
  A.object [ "@type" A..= T.String "inputFileRemote", "id" A..= _id ]

 toJSON (InputFileLocal { path = path }) =
  A.object [ "@type" A..= T.String "inputFileLocal", "path" A..= path ]

 toJSON (InputFileGenerated { expected_size = expected_size, conversion = conversion, original_path = original_path }) =
  A.object [ "@type" A..= T.String "inputFileGenerated", "expected_size" A..= expected_size, "conversion" A..= conversion, "original_path" A..= original_path ]
-- inputFileId InputFile  { __id :: Int } 

-- inputFileRemote InputFile  { _id :: String } 

-- inputFileLocal InputFile  { path :: String } 

-- inputFileGenerated InputFile  { expected_size :: Int, conversion :: String, original_path :: String } 

