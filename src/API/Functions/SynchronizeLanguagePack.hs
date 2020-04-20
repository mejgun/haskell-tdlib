-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SynchronizeLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SynchronizeLanguagePack = 
 SynchronizeLanguagePack { language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON SynchronizeLanguagePack where
 toJSON (SynchronizeLanguagePack { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "synchronizeLanguagePack", "language_pack_id" A..= language_pack_id ]
-- synchronizeLanguagePack SynchronizeLanguagePack  { language_pack_id :: String } 

