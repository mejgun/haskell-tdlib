-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallRating where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProblem as CallProblem

--main = putStrLn "ok"

data SendCallRating = 
 SendCallRating { problems :: [CallProblem.CallProblem], comment :: String, rating :: Int, call_id :: Int }  -- deriving (Show)

instance T.ToJSON SendCallRating where
 toJSON (SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }) =
  A.object [ "@type" A..= T.String "sendCallRating", "problems" A..= problems, "comment" A..= comment, "rating" A..= rating, "call_id" A..= call_id ]
-- sendCallRating SendCallRating  { problems :: [CallProblem.CallProblem], comment :: String, rating :: Int, call_id :: Int } 



instance T.FromJSON SendCallRating where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallRating" -> parseSendCallRating v
  where
   parseSendCallRating :: A.Value -> T.Parser SendCallRating
   parseSendCallRating = A.withObject "SendCallRating" $ \o -> do
    problems <- o A..: "problems"
    comment <- o A..: "comment"
    rating <- o A..: "rating"
    call_id <- o A..: "call_id"
    return $ SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }