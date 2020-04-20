-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ClearRecentStickers = 
 ClearRecentStickers { is_attached :: Bool }  -- deriving (Show)

instance T.ToJSON ClearRecentStickers where
 toJSON (ClearRecentStickers { is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "clearRecentStickers", "is_attached" A..= is_attached ]
-- clearRecentStickers ClearRecentStickers  { is_attached :: Bool } 

