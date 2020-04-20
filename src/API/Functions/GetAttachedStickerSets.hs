-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAttachedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetAttachedStickerSets = 
 GetAttachedStickerSets { file_id :: Int }  -- deriving (Show)

instance T.ToJSON GetAttachedStickerSets where
 toJSON (GetAttachedStickerSets { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getAttachedStickerSets", "file_id" A..= file_id ]
-- getAttachedStickerSets GetAttachedStickerSets  { file_id :: Int } 

